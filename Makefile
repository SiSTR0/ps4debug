# make ps4debug

TARGET = ps4debug.bin

all: clean $(TARGET)

$(TARGET):
	cd ps4-payload-sdk/libPS4 && $(MAKE) -s
	cd ps4-ksdk && $(MAKE) -s
	cd debugger && $(MAKE) -s
	cd kdebugger && $(MAKE) -s
	cd installer && $(MAKE) -s
	cp installer/installer.bin $(TARGET)
	
.PHONY: clean
clean:
	rm -f $(TARGET)
	cd ps4-payload-sdk/libPS4 && $(MAKE) -s clean
	cd ps4-ksdk && $(MAKE) -s clean
	cd installer && $(MAKE) -s clean
	cd kdebugger && $(MAKE) -s clean
	cd debugger && $(MAKE) -s clean
