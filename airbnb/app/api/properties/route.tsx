import { NextRequest, NextResponse } from "next/server";

// this get method for getting properties
export function GET(request: NextRequest) {
  return NextResponse.json("poperties data sent.");
}
