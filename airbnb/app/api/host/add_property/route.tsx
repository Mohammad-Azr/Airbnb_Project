import { NextRequest, NextResponse } from "next/server";

// this post method for posting a new property by a host
export async function POST(request: NextRequest) {
  const body = await request.json();
  return NextResponse.json(body);
}
