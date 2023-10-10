import { NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";

export async function POST() {
    // function is for inserting bigint data without error otherwise it will throw error
    BigInt.prototype.toJSON = function () {
        return this.toString();
    };
    // iNSERT data
    try {
        let prisma = new PrismaClient();
        // insert data
        const result = await prisma.user.create({
            data: {
                firstName: "Sk",
                middleName: "JAMIL",
                lastName: "noor",
                mobile: "01681092545",
                email: "shaikhjamil@gmail.com",
                passwordHash: "1234",
                intro: "fsadfsadfsadfsaf",
                profile: "fasdfsdfsdf",
            },
        });
        return NextResponse.json({ msg: "success", data: result });
    } catch (error) {
        return NextResponse.json({ msg: "fail", data: error });
    }
}

export async function PATCH() {
    // update data
    try {
        let prisma = new PrismaClient();
        const result = await prisma.user.update({
            where: {
                id: 1,
            },
            data: {
                firstName: "Sk...",
                middleName: "Jamil...",
                lastName: "Noor",
                mobile: "0000000000",
                email: "shaikhjamilrazi@gmail.com",
            },
        });
        return NextResponse.json({ msg: "success", data: result });
    } catch (error) {
        return NextResponse.json({ msg: "fail", data: error });
    }
}

export async function DELETE() {
    // delete data
    try {
        let prisma = new PrismaClient();
        const result = await prisma.user.delete({
            where: { id: 1 },
        });
        return NextResponse.json({ msg: "success", data: result });
    } catch (error) {
        return NextResponse.json({ msg: "fail", data: error });
    }
}

export async function GET() {
    // read data
    try {
        let prisma = new PrismaClient();
        const result = await prisma.user.findMany({
            where: { id: 1 },
            select: {
                email: true,
            },
        });
        return NextResponse.json({ msg: "success", data: result });
    } catch (error) {
        return NextResponse.json({ msg: "fail", data: error });
    }
}
