import { NextRequest, NextResponse } from "next/server";

// this get methode for getting user data
export function GET(
  request: NextRequest,
  { params }: { params: { id: number } }
) {
  // get user by params.id
  return NextResponse.json("user data here");
}
