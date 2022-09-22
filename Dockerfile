#
# This is the OpenShift ovn overlay network image.
# it provides an overlay network using ovs/ovn/ovn-kube
#
# The standard name for this image is ovn-kube

# Notes:
# This is for a build where the ovn-kubernetes utilities
# are built in this Dockerfile and included in the image (instead of the rpm)
#

FROM registry.ci.openshift.org/ocp/builder:rhel-8-golang-1.18-openshift-4.12 AS builder

COPY empty.go .
COPY go.mod .

# build the binaries
RUN CGO_ENABLED=0 go build -o empty ./empty.go

FROM scratch



COPY --from=builder /go/src/github.com/openshift/origin/empty .



ENTRYPOINT ["/empty", "1"]

