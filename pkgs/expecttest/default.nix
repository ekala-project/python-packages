{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "expecttest";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytorch";
    repo = "expecttest";
    tag = "v${version}";
    hash = "sha256-/BMaQD3ZgYiprRYZ/fIlW7mStyFGzsjqup62tegBP7Y=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "expecttest" ];

  meta = {
    description = ''EZ Yang "golden" tests (testing against a reference implementation)'';
    homepage = "https://github.com/pytorch/expecttest";
    license = lib.licenses.mit;
  };
}
