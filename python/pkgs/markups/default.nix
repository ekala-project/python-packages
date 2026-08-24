{ lib
, buildPythonPackage
, docutils
, fetchFromGitHub
, markdown
, pygments
, python-markdown-math
, pyyaml
, setuptools
, textile
,
}:

buildPythonPackage rec {
  pname = "markups";
  version = "4.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "retext-project";
    repo = "pymarkups";
    tag = version;
    hash = "sha256-kQ1L8l/ONT4qOA/xfx85WyA7pDveaKoXWGZbljYxO/4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    docutils
    markdown
    pygments
    python-markdown-math
    pyyaml
    textile
  ];

  pythonImportsCheck = [ "markups" ];

  meta = {
    description = "Wrapper around various text markup languages";
    homepage = "https://github.com/retext-project/pymarkups";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
