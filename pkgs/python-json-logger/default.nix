{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-json-logger";
  version = "4.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nhairs";
    repo = "python-json-logger";
    tag = "v${version}";
    hash = "sha256-YFtM+YWXDCaipqhQntdGeGbTmWO5XMGfpWhgQwicxFQ=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Json Formatter for the standard python logger";
    homepage = "https://github.com/madzak/python-json-logger";
    license = lib.licenses.bsdOriginal;
  };
}
