{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  tqdm,
  spacy,
}:

buildPythonPackage rec {
  pname = "pysbd";
  version = "0.3.4";
  pyproject = true;

  # provides no sdist on pypi
  src = fetchFromGitHub {
    owner = "nipunsadvilkar";
    repo = "pySBD";
    tag = "v${version}";
    sha256 = "12p7qm237z56hw4zr03n8rycgfymhki2m9c4w3ib0mvqq122a5dp";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pysbd" ];

  meta = {
    description = "Pysbd (Python Sentence Boundary Disambiguation) is a rule-based sentence boundary detection that works out-of-the-box across many languages";
    homepage = "https://github.com/nipunsadvilkar/pySBD";
    license = lib.licenses.mit;
  };
}
