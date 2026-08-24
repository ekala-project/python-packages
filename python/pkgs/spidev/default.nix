{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
,
}:

buildPythonPackage rec {
  pname = "spidev";
  version = "3.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "doceme";
    repo = "py-spidev";
    tag = "v${version}";
    hash = "sha256-ysOLZWsMiHjPxQ7fMWsywp44vkNGFGH8n6X7zk7XQck=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "spidev" ];

  meta = {
    homepage = "https://github.com/doceme/py-spidev";
    description = "Python bindings for Linux SPI access through spidev";
    license = lib.licenses.mit;
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
}
