{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "bhopengraph";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "p0dalirius";
    repo = "bhopengraph";
    tag = "v${finalAttrs.version}";
    hash = "sha256-pT+xdcxFLQUrXpZxS0gmXjyhtR1jqDsBAPHgEhxX2R8=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "bhopengraph" ];

  # Module has no tests
  doCheck = false;

  meta = {
    description = "Library to create BloodHound OpenGraphs";
    homepage = "https://github.com/p0dalirius/bhopengraph";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
