{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "zipstream-ng";
  version = "1.9.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pR0Ps";
    repo = "zipstream-ng";
    tag = "v${finalAttrs.version}";
    hash = "sha256-1MSnabckpAwV/NmD5wKxF7k7hwve6fBiCPyw7skxdlM=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "zipstream" ];

  meta = {
    description = "Library to generate streamable zip files";
    homepage = "https://github.com/pR0Ps/zipstream-ng";
    license = lib.licenses.lgpl3Only;
  };
})
