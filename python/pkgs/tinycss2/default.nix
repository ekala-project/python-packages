{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  webencodings,
}:

buildPythonPackage rec {
  pname = "tinycss2";
  version = "1.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kozea";
    repo = "tinycss2";
    tag = "v${version}";
    hash = "sha256-34qmoKVH5M0l5Is7YoreN9X3iPD0km0TLvGLbfW8KBY=";
  };

  build-system = [ flit-core ];

  dependencies = [ webencodings ];

  meta = {
    description = "Low-level CSS parser for Python";
    homepage = "https://github.com/Kozea/tinycss2";
    license = lib.licenses.bsd3;
  };
}
