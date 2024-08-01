def ip_to_binary(ip):
    return ''.join([format(int(octet), '08b') for octet in ip.split('.')])

def binary_to_ip(binary):
    return '.'.join([str(int(binary[i:i+8], 2)) for i in range(0, 32, 8)])

def apply_netmask(ip, netmask):
    ip_bin = ip_to_binary(ip)
    netmask_bin = ip_to_binary(netmask)
    network_bin = ''.join(['1' if ip_bin[i] == '1' and netmask_bin[i] == '1' else '0' for i in range(32)])
    return binary_to_ip(network_bin)

def netmask_to_prefix(netmask):
    # Split the netmask into its octets
    octets = netmask.split('.')
    # Convert each octet to binary and count the number of 1's
    binary_str = ''.join([format(int(octet), '08b') for octet in octets])
    # Count the number of 1's in the binary string
    prefix_length = binary_str.count('1')
    return prefix_length

ip = "192.168.1.10"
netmask = "255.255.255.0"
network = apply_netmask(ip, netmask)
print(f"L'adresse réseau pour {ip} avec le netmask {netmask} est {network}")
netmask2 = "255.255.254.0"
print("Net mask2: " + netmask + " to binary:", ip_to_binary(netmask2))
print("Net mask prefix:", netmask_to_prefix(netmask))
