FROM ubuntu:latest

# Install SSH server and other necessary packages
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    bash && \
    mkdir /var/run/sshd

# Create CTF user and set password
RUN useradd -m -s /bin/bash ctfuser && \
    echo "ctfr2:ctfriend2" | chpasswd && \
    mkdir -p /home/ctfuser/.ssh

# Restrict shell input (no letters allowed)
RUN echo 'bind -r a' >> /home/ctfuser/.bashrc && \
    echo 'bind -r b' >> /home/ctfuser/.bashrc && \
    echo 'bind -r c' >> /home/ctfuser/.bashrc && \
    echo 'bind -r d' >> /home/ctfuser/.bashrc && \
    echo 'bind -r e' >> /home/ctfuser/.bashrc && \
    echo 'bind -r f' >> /home/ctfuser/.bashrc && \
    echo 'bind -r g' >> /home/ctfuser/.bashrc && \
    echo 'bind -r h' >> /home/ctfuser/.bashrc && \
    echo 'bind -r i' >> /home/ctfuser/.bashrc && \
    echo 'bind -r j' >> /home/ctfuser/.bashrc && \
    echo 'bind -r k' >> /home/ctfuser/.bashrc && \
    echo 'bind -r l' >> /home/ctfuser/.bashrc && \
    echo 'bind -r m' >> /home/ctfuser/.bashrc && \
    echo 'bind -r n' >> /home/ctfuser/.bashrc && \
    echo 'bind -r o' >> /home/ctfuser/.bashrc && \
    echo 'bind -r p' >> /home/ctfuser/.bashrc && \
    echo 'bind -r q' >> /home/ctfuser/.bashrc && \
    echo 'bind -r r' >> /home/ctfuser/.bashrc && \
    echo 'bind -r s' >> /home/ctfuser/.bashrc && \
    echo 'bind -r t' >> /home/ctfuser/.bashrc && \
    echo 'bind -r u' >> /home/ctfuser/.bashrc && \
    echo 'bind -r v' >> /home/ctfuser/.bashrc && \
    echo 'bind -r w' >> /home/ctfuser/.bashrc && \
    echo 'bind -r x' >> /home/ctfuser/.bashrc && \
    echo 'bind -r y' >> /home/ctfuser/.bashrc && \
    echo 'bind -r z' >> /home/ctfuser/.bashrc && \
    echo 'bind -r A' >> /home/ctfuser/.bashrc && \
    echo 'bind -r B' >> /home/ctfuser/.bashrc && \
    echo 'bind -r C' >> /home/ctfuser/.bashrc && \
    echo 'bind -r D' >> /home/ctfuser/.bashrc && \
    echo 'bind -r E' >> /home/ctfuser/.bashrc && \
    echo 'bind -r F' >> /home/ctfuser/.bashrc && \
    echo 'bind -r G' >> /home/ctfuser/.bashrc && \
    echo 'bind -r H' >> /home/ctfuser/.bashrc && \
    echo 'bind -r I' >> /home/ctfuser/.bashrc && \
    echo 'bind -r J' >> /home/ctfuser/.bashrc && \
    echo 'bind -r K' >> /home/ctfuser/.bashrc && \
    echo 'bind -r L' >> /home/ctfuser/.bashrc && \
    echo 'bind -r M' >> /home/ctfuser/.bashrc && \
    echo 'bind -r N' >> /home/ctfuser/.bashrc && \
    echo 'bind -r O' >> /home/ctfuser/.bashrc && \
    echo 'bind -r P' >> /home/ctfuser/.bashrc && \
    echo 'bind -r Q' >> /home/ctfuser/.bashrc && \
    echo 'bind -r R' >> /home/ctfuser/.bashrc && \
    echo 'bind -r S' >> /home/ctfuser/.bashrc && \
    echo 'bind -r T' >> /home/ctfuser/.bashrc && \
    echo 'bind -r U' >> /home/ctfuser/.bashrc && \
    echo 'bind -r V' >> /home/ctfuser/.bashrc && \
    echo 'bind -r W' >> /home/ctfuser/.bashrc && \
    echo 'bind -r X' >> /home/ctfuser/.bashrc && \
    echo 'bind -r Y' >> /home/ctfuser/.bashrc && \
    echo 'bind -r Z' >> /home/ctfuser/.bashrc

# Create flag directory and file
RUN mkdir -p /home/ctfuser/hidden_directory && \
    echo "CTFr2{n0_l3tt3r\$_4ll0w3d_F0r_u}" > /home/ctfuser/hidden_directory/flag.txt && \
    chmod 400 /home/ctfuser/hidden_directory/flag.txt && \
    chmod 500 /home/ctfuser/hidden_directory && \
    chown -R ctfuser:ctfuser /home/ctfuser/hidden_directory

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]
