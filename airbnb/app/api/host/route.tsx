import { NextRequest, NextResponse } from "next/server";

// this get methode for getting host data
export function GET(request: NextRequest) {
  return NextResponse.json("host data here");
}
