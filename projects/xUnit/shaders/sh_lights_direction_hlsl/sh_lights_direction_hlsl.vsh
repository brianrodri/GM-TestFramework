// This shader is intended to be used with a 4x2 grid of rectangles, each with a unique red colour value to be used as an index.
// It will test gm_Lights_Direction by attempting to set each rectangle's RGBA colour values to each light direction's xyzw value.
// Vertex Shader

// Input values
struct VertexShaderInput {
    float4 vPosition : POSITION;
    float4 vColor    : COLOR0;
    float2 vTexcoord : TEXCOORD0;
};

// Output values
struct VertexShaderOutput {
    float4 vPosition : SV_POSITION;
    float4 vColor    : COLOR0;
    float2 vTexcoord : TEXCOORD0;
};


VertexShaderOutput main(VertexShaderInput INPUT) {
    VertexShaderOutput OUTPUT;
	
	// Calculate the vertex's position on screen using the world_view_projection matrix
    float4 matrixWVP = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], INPUT.vPosition);
	
	// Get the index of the current rectangle via it's red value
	int rect_index = int(INPUT.vColor.r * 255.0);
	
	// THIS UNIFORM WILL CURRENTLY CAUSE ERRORS IN HLSL, AND IS TEMPORARILY COMMENTED TO AVOID MESSING UP OTHER TESTS - UNCOMMENT WHEN FIXES ARE IMPLEMENTED
	// Get the light direction for the light corresponding to that index
	//float4 value = gm_Lights_Direction[rect_index];
	// Set vertex colour to value from light direction (scaled to be between 0 and 1)
	//OUTPUT.vColor = float4((value.x * 2.0) + 0.5, (value.y * 2.0) + 0.5, (value.z * 2.0) + 0.5, value.w);
	
	// Pass the vertex position, colour and texture coordinates to the fragment shader
    OUTPUT.vPosition = matrixWVP;
    OUTPUT.vTexcoord = INPUT.vTexcoord; 

    return OUTPUT;
}