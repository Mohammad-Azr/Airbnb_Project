import { NextRequest, NextResponse } from "next/server";

// this get methode for getting a single property data
export function GET(
  request: NextRequest,
  { params }: { params: { id: number } }
) {
  // get property by params.id
  return NextResponse.json({ id: params.id, msg: "property data here" });
}
