FROM gnuoctave/octave:7.2.0

# install some dependencies
RUN apt update
RUN apt install -y octave-jsonlab

# create the tool input structure
RUN mkdir /in
COPY ./in /in
RUN mkdir /out
RUN mkdir /src
COPY ./src /src

# copy the cu curve tool into the source
COPY ./c_u_curve /src/

# download yq to convert yaml files
RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /src/yq && chmod +x /src/yq

WORKDIR /src
CMD ["octave", "runTool.m"]