import { NextRequest, NextResponse } from "next/server";
import prisma from "@/prisma/client";

// this get method for getting properties
export async function GET(request: NextRequest) {
  const properties = await prisma.properties.findMany();
  return NextResponse.json(properties);
}
