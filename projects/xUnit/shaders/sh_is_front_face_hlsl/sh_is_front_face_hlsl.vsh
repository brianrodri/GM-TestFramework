// This shader tests SV_IsFrontFace by colouring anything that it considers front-facing green, and everything else red
// Vertex Shader

// Input values
struct VertexShaderInput {
    float4 vPosition : POSITION;
	float3 vNormal	 : NORMAL;
    float4 vColor    : COLOR0;
    float2 vTexcoord : TEXCOORD0;
};

// Output values
struct VertexShaderOutput {
    float4 vPosition : SV_POSITION;
	float3 vNormal	 : NORMAL;
    float4 vColor    : COLOR0;
    float2 vTexcoord : TEXCOORD0;
};


VertexShaderOutput main(VertexShaderInput INPUT) {
    VertexShaderOutput OUTPUT;
	
	// Calculate the vertex's position on screen using the world_view_projection matrix
    float4 matrixWVP = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], INPUT.vPosition);
	
	// Pass the vertex position, normal, colour and texture coordinates to the fragment shader
    OUTPUT.vPosition = matrixWVP;
	OUTPUT.vNormal	 = INPUT.vNormal;
    OUTPUT.vColor    = INPUT.vColor;
    OUTPUT.vTexcoord = INPUT.vTexcoord; 

    return OUTPUT;
}