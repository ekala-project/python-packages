{
  lib,
  asyncssh,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  httpcore,
  httpx,
  psrpcore,
  psutil,
  pyspnego,
  requests,
  requests-credssp,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pypsrp";
  version = "0.9.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jborean93";
    repo = "pypsrp";
    tag = "v${finalAttrs.version}";
    hash = "sha256-a0xTYrdy0SwYQ7NS/hm80BAarjhUazP/I/J7PlsIWIM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    httpcore
    httpx
    psrpcore
    pyspnego
    requests
  ];

  optional-dependencies = {
    credssp = [ requests-credssp ];
    kerberos = pyspnego.optional-dependencies.kerberos;
    named_pipe = [ psutil ];
    ssh = [ asyncssh ];
  };
  pythonImportsCheck = [ "pypsrp" ];
  meta = {
    description = "PowerShell Remoting Protocol Client library";
    homepage = "https://github.com/jborean93/pypsrp";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
