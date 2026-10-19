{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  oyaml,
  packaging,
  paramiko,
  pexpect,
  requests,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "fortiosapi";
  version = "1.0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fortinet-solutions-cse";
    repo = "fortiosapi";
    tag = "v${finalAttrs.version}";
    hash = "sha256-M71vleEhRYnlf+RSGT1GbCy5NEZaG0hWmJo01n9s6Rg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pexpect
    requests
    paramiko
    packaging
    oyaml
    six
  ];

  # Tests require a local VM

  pythonImportsCheck = [ "fortiosapi" ];

  meta = {
    description = "Python module to work with Fortigate/Fortios devices";
    homepage = "https://github.com/fortinet-solutions-cse/fortiosapi";
    license = lib.licenses.asl20;
  };
})
