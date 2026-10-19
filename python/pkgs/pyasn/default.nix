{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchFromGitHub,
  # build-system
  setuptools,
  python,
}:

buildPythonPackage rec {
  pname = "pyasn";
  version = "1.6.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-otVfs+5HlHYJ9QIRylsLrEEahvPJNfuSyksLirfGaP8=";
  };

  build-system = [ setuptools ];

  datasrc = fetchFromGitHub {
    owner = "hadiasghari";
    repo = "pyasn";
    tag = version;
    hash = "sha256-7zpaxDe5qHUy/ekOJLxKawjaPQnByrOVj+m2bsUqfdg=";
  };

  postInstall = ''
    install -dm755 $out/${python.sitePackages}/pyasn/data
    cp $datasrc/data/* $out/${python.sitePackages}/pyasn/data
  '';

  pythonImportsCheck = [ "pyasn" ];

  meta = {
    description = "Offline IP address to Autonomous System Number lookup module";
    homepage = "https://github.com/hadiasghari/pyasn";
    license = with lib.licenses; [
      bsdOriginal
      mit
    ];
  };
}
