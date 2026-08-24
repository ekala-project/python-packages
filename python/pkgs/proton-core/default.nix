{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  aiohttp,
  bcrypt,
  pyopenssl,
  python-gnupg,
  requests,
}:

buildPythonPackage rec {
  pname = "proton-core";
  version = "0.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ProtonVPN";
    repo = "python-proton-core";
    tag = "v${version}";
    hash = "sha256-ZT/LkppzeEDGs9aOCx561fA1EgAShPCnMs8c05mgF0k=";
  };

  build-system = [ setuptools ];

  dependencies = [
    bcrypt
    aiohttp
    pyopenssl
    python-gnupg
    requests
  ];

  pythonImportsCheck = [ "proton" ];

  meta = {
    description = "Core logic used by the other Proton components";
    homepage = "https://github.com/ProtonVPN/python-proton-core";
    license = lib.licenses.gpl3Only;
    maintainers = [ ];
  };
}
