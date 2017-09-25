# -*- coding: UTF-8 -*-
"""
Module generate weekly connection statistic
"""

import psycopg2


def get_files():
    """
    Reading stat files
    """

    atms = []

    with open("event.csv") as csv_file:
        csv_file.readline()

        for line in csv_file:
            atm = line.strip().split("|")
            atms.append([atm[1], atm[2], int(atm[11])])

    atms.sort(key=lambda i: i[2], reverse=True)
    atms = atms[:7]

    with open("day.csv") as csv_file:
        csv_file.readline()

        for line in csv_file:
            atm = line.strip().split("|")

            for row in atms:
                if atm[1] == row[0]:
                    atms[atms.index(row)].append(atm[18])

    return atms


def get_addresses(atms):
    """
    Obtain addresses from DB
    """

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
    """
    Write result into file
    """

    with open("result.csv", "w") as result_file:

        for atm in atms:
            line = atm[0] + "|" + atm[1] + "|" + atm[2] + "|" + str(atm[3]) + \
                        "|" + atm[4] + "\n"
            result_file.write(line)


def main():
    """
    Main function
    """

    atms = get_files()

    if atms:
        print("Files parsed")

    atms = get_addresses(atms)

    if atms:
        print("Addresses obtained")

    write_file(atms)
    print("All done. result.csv generated")


if __name__ == "__main__":
    main()
