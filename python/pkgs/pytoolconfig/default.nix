{
  lib,
  buildPythonPackage,
  docutils,
  fetchFromGitHub,
  packaging,
  pdm-backend,
  platformdirs,
  pydantic,
  sphinx,
  sphinx-autodoc-typehints,
  sphinx-rtd-theme,
  sphinxHook,
  tabulate,
}:

buildPythonPackage rec {
  pname = "pytoolconfig";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bagel897";
    repo = "pytoolconfig";
    tag = "v${version}";
    hash = "sha256-h21SDgVsnCDZQf5GS7sFE19L/p+OlAFZGEYKc0RHn30=";
  };

  outputs = [
    "out"
  ];

  env.PDM_PEP517_SCM_VERSION = version;

  nativeBuildInputs = [
    pdm-backend

    # docs
    docutils
    sphinx-autodoc-typehints
    sphinx-rtd-theme
    sphinxHook
  ];
  propagatedBuildInputs = [ packaging ];

  optional-dependencies = {
    validation = [ pydantic ];
    global = [ platformdirs ];
    doc = [
      sphinx
      tabulate
    ];
  };

  pythonImportsCheck = [ "pytoolconfig" ];

  meta = {
    description = "Python tool configuration";
    homepage = "https://github.com/bagel897/pytoolconfig";
    license = lib.licenses.lgpl3Plus;
    maintainers = [ ];
  };
}
