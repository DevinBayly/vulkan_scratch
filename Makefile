CFLAGS = -std=c++17 -g 
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi -I./

VulkanTest: main.cpp shaders
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS)

.PHONY: test clean

test: VulkanTest
	./VulkanTest

shaders: shader.vert shader.frag
	./install/bin/glslc shader.vert -o shaders/vert.spv
	./install/bin/glslc shader.frag -o shaders/frag.spv

clean:
	rm -f VulkanTest

