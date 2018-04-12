FROM library/centos:7 as builder

COPY . /opt/hw
WORKDIR /opt/hw

RUN yum update
RUN yum install java-1.8.0-openjdk-devel -y

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64
ENV PATH $JAVA_HOME/bin:$PATH

RUN ./gradlew clean buildRpm

# ------------------------------------------------------------------------

FROM library/centos:7
ENV RPM_WORKSPACE /opt/hw
COPY --from=builder /opt/hw/build/distributions/ $RPM_WORKSPACE
WORKDIR $RPM_WORKSPACE
RUN rpm -i /opt/hw/rpm-hw-1.0.1-1.noarch.rpm
CMD ["hw"]