{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "annotated-types";
  version = "0.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "annotated-types";
    repo = "annotated-types";
    tag = "v${version}";
    hash = "sha256-3ztALuBF4zJ7Fc1UCWqWRMm/a8Y0I/al+M2B669D314=";
  };

  nativeBuildInputs = [ hatchling ];

  pythonImportsCheck = [ "annotated_types" ];

  meta = {
    description = "Reusable constraint types to use with typing.Annotated";
    homepage = "https://github.com/annotated-types/annotated-types";
    license = lib.licenses.mit;
  };
}
