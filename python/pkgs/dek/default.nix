{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  xmod,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "dek";
  version = "1.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rec";
    repo = "dek";
    rev = "v${version}";
    hash = "sha256-G0m8p8nvvhQAccvkkD7WwmL3iA/zgS7CsyPwtHdoxJM=";
  };

  build-system = [ hatchling ];

  dependencies = [ xmod ];

  nativeBuildInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "dek" ];

  meta = {
    description = "Decorator-decorator";
    homepage = "https://github.com/rec/dek";
    license = lib.licenses.mit;
  };
}
