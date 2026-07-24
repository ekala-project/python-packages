{
  lib,
  stdenv,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "psrpcore";
  version = "0.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jborean93";
    repo = "psrpcore";
    tag = "v${version}";
    hash = "sha256-svfqTOKKFKMphIPnvXfAbPZrp1GTV2D+33I0Rajfv1Y=";
  };

  build-system = [ setuptools ];

  dependencies = [ cryptography ];
  pythonImportsCheck = [ "psrpcore" ];

  meta = {
    description = "Library for the PowerShell Remoting Protocol (PSRP)";
    homepage = "https://github.com/jborean93/psrpcore";
    license = lib.licenses.mit;
    maintainers = [ ];
    broken = stdenv.hostPlatform.isDarwin;
  };
}
