#version 130

uniform vec3 uLight, uLight2, uColor;
uniform int uUseTexture;
uniform sampler2D uTexUnit;

in vec3 vNormal;
in vec3 vPosition;
in vec2 vTexCoord;

out vec4 fragColor;

void main() {
	vec3 tolight = normalize(uLight - vPosition);
	vec3 tolight2 = normalize(uLight2 - vPosition);
	vec3 normal = normalize(vNormal);

	float diffuse = max(0.0, dot(normal, tolight));
	diffuse += max(0.0, dot(normal, tolight2));
	  
	if(uUseTexture == 0) {
	  vec3 intensity = uColor * diffuse;

	  fragColor = vec4(intensity, 1.0);
  } else {
	fragColor = texture(uTexUnit, vTexCoord)*diffuse;
  }
}
