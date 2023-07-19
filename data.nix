let
  name = "michael";
in
{
  user = {
    name = name;
    initialPassword = "password123";
    fullName = "Michael Strobel";
    email = "mstrobel97@gmail.com";
    keyid = "0x3B6861376B6D3D78";
  };

  location = "/home/${name}/.nixos-config";
}
