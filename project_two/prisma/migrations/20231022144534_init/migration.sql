-- CreateTable
CREATE TABLE "Rooms" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "number" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "available" BOOLEAN NOT NULL,
    "price" INTEGER NOT NULL,
    "floor" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Person" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "email" TEXT,
    "phone" TEXT NOT NULL,
    "govid" TEXT NOT NULL,
    "address" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Bookings" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "checkin" DATETIME NOT NULL,
    "checkout" DATETIME NOT NULL,
    "bill" INTEGER NOT NULL,
    "roomId" TEXT NOT NULL,
    "personId" TEXT NOT NULL,
    CONSTRAINT "Bookings_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Rooms" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Bookings_personId_fkey" FOREIGN KEY ("personId") REFERENCES "Person" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
