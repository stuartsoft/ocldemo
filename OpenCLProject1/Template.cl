/*****************************************************************************
 * Copyright (c) 2013-2016 Intel Corporation
 * All rights reserved.
 *
 * WARRANTY DISCLAIMER
 *
 * THESE MATERIALS ARE PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL INTEL OR ITS
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THESE
 * MATERIALS, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Intel Corporation is the author of the Materials, and requests that all
 * problem reports or change requests be submitted to it directly
 *****************************************************************************/

__kernel void Sobel(__global int* pA, __global float3* pC)
{
    const int x     = get_global_id(0);
    const int y     = get_global_id(1);
    const int width = get_global_size(0);

    const int id0 = (y-1) * width + (x-1);
    const int id1 = (y-1) * width + x;
    const int id2 = (y-1) * width + (x+1);
    const int id3 = y * width + (x-1);
    const int id4 = y * width + (x+1);
    const int id5 = (y+1) * width + (x-1);
    const int id6 = (y+1) * width + x;
    const int id7 = (y+1) * width + (x+1);

	const int id = y * width + x;

	float3 pixels[8];
	pixels[0] = pA[id0];
	pixels[1] = pA[id1];
	pixels[2] = pA[id2];
	pixels[3] = pA[id3];
	pixels[4] = pA[id4];
	pixels[5] = pA[id5];
	pixels[6] = pA[id6];
	pixels[7] = pA[id7];

	//load in necessary pixels (neighbors)
	float3 pixels[8];
	//check for pixels on the boarders of the image
		//if x == 0 or x == width-1, replace pixels[outOfBoundsNeighbor] with black
		//if y == 0 or y == height-1, replace pixels[outOfBoundsNeightbor] with black

	//calculate G
	float2 G;
		//calculate G.x
		//calculate G.y

	//get length of G
	float3 result(length(G), length(G), length(G));

	//save result into pC
	pC[id] = result;
}
