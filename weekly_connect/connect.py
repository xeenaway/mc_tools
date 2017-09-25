# -*- coding: UTF-8 -*-
"""Module generate weekly connection statistic"""

import csv
import psycopg2


def get_files():
    """Reading stat files"""

    atms = []

    with open("event.csv", "r", newline="") as csv_file:
        reader = csv.DictReader(csv_file, delimiter="|")
        for row in reader:
            atms.append([row["ID"], row["agent_offline"], int(row["offline"])])

    atms.sort(key=lambda i: i[2], reverse=True)
    atms = atms[:7]

    with open("day.csv") as csv_file:
        reader = csv.DictReader(csv_file, delimiter="|")
        for row in reader:
            for atm in atms:
                if row["ID"] == atm[0]:
                    atms[atms.index(atm)].append(row["host"])

    return atms


def get_addresses(atms):
    """Obtain addresses from DB"""

    connect = psycopg2.connect(
        database="mc",
        user="postgres",
        password="1Q2w3e4r",
        host="127.0.0.1",
        port="5432")
    cursor = connect.cursor()

    for atm in atms:
        atm_id = atm[0].zfill(6)
        cursor.execute(
            "SELECT address \
            FROM atms \
            WHERE machine_no = %s;",
            (atm_id,))

        atm_db = cursor.fetchone()
        atms[atms.index(atm)].insert(1, atm_db[0])

    connect.close()
    return atms


def write_file(atms):
    """Write result into file"""

    with open("result.csv", "w") as result_file:
        for atm in atms:
            line = atm[0] + "|" + atm[1] + "|" + atm[2] + "|" + str(atm[3]) + \
                "|" + atm[4] + "\n"
            result_file.write(line)


def main():
    """Main function"""

    atms = get_files()

    if atms:
        print("Files parsed")

    atms = get_addresses(atms)

    if atms:
        print("Addresses obtained")

    write_file(atms)
    print("All done. \"result.csv\" generated")


if __name__ == "__main__":
    main()
