{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cymem,
  cython,
  murmurhash,
  numpy,
  preshed,
  thinc,

  # dependencies
  catalogue,
  jinja2,
  langcodes,
  packaging,
  pydantic,
  requests,
  setuptools,
  spacy-legacy,
  spacy-loggers,
  srsly,
  tqdm,
  typer,
  wasabi,
  weasel,
}:

buildPythonPackage (finalAttrs: {
  pname = "spacy";
  version = "3.8.14";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "explosion";
    repo = "spaCy";
    tag = "release-v${finalAttrs.version}";
    hash = "sha256-w9cNP304H/EntpoMkXGwkxIVoThkl5HZPDK4+k4Py0Y=";
  };

  build-system = [
    cymem
    cython
    murmurhash
    numpy
    preshed
    thinc
  ];

  pythonRelaxDeps = [ "thinc" ];

  dependencies = [
    catalogue
    cymem
    jinja2
    langcodes
    murmurhash
    numpy
    packaging
    preshed
    pydantic
    requests
    setuptools
    spacy-legacy
    spacy-loggers
    srsly
    thinc
    tqdm
    typer
    wasabi
    weasel
  ];

  pythonImportsCheck = [ "spacy" ];

  meta = {
    description = "Industrial-strength Natural Language Processing (NLP)";
    homepage = "https://github.com/explosion/spaCy";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "spacy";
  };
})
