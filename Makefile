GO_BIN_NAME = tlspxy
GO_INSTALL_PATH = /usr/local/bin/tlspxy

build: deps
	CGO_ENABLED=0 GO15VENDOREXPERIMENT=1 \
	go build -x -a -installsuffix cgo -o $(GO_BIN_NAME)

install: build
	rm -f $(GO_INSTALL_PATH); \
	mv $(GO_BIN_NAME) $(GO_INSTALL_PATH)

deps:
	go get github.com/Masterminds/glide
	glide up

clean:
	rm -Rf vendor/ glide.lock tlspxy
