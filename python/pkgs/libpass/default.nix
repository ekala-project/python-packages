{
  argon2-cffi,
  bcrypt,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  hatchling,
  lib,
}:

buildPythonPackage rec {
  pname = "libpass";
  version = "1.9.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ThirVondukr";
    repo = "passlib";
    tag = version;
    hash = "sha256-fzI9HpGE3wNK41ZSOeA5NAr5T4r3Jzdqe5+SHoWVXUs=";
  };

  build-system = [ hatchling ];

  optional-dependencies = {
    argon2 = [ argon2-cffi ];
    bcrypt = [ bcrypt ];
    totp = [ cryptography ];
  };

  pythonImportsCheck = [ "passlib" ];

  meta = {
    description = "Comprehensive password hashing framework supporting over 30 schemes";
    homepage = "https://github.com/ThirVondukr/passlib";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
