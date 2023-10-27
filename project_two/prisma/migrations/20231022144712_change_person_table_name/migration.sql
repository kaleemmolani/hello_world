/*
  Warnings:

  - You are about to drop the `Person` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Person";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Persons" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "email" TEXT,
    "phone" TEXT NOT NULL,
    "govid" TEXT NOT NULL,
    "address" TEXT NOT NULL
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Bookings" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "checkin" DATETIME NOT NULL,
    "checkout" DATETIME NOT NULL,
    "bill" INTEGER NOT NULL,
    "roomId" TEXT NOT NULL,
    "personId" TEXT NOT NULL,
    CONSTRAINT "Bookings_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Rooms" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Bookings_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Persons" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Bookings" ("bill", "checkin", "checkout", "id", "personId", "roomId") SELECT "bill", "checkin", "checkout", "id", "personId", "roomId" FROM "Bookings";
DROP TABLE "Bookings";
ALTER TABLE "new_Bookings" RENAME TO "Bookings";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
