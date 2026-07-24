{
  lib,
  buildPythonPackage,
  fetchFromCodeberg,
  setuptools,
  setuptools-scm,
  hypothesis,
  pytest-timeout,
}:

buildPythonPackage rec {
  pname = "multivolumefile";
  version = "0.2.3";
  pyproject = true;

  src = fetchFromCodeberg {
    owner = "miurahr";
    repo = "multivolume";
    tag = "v${version}";
    hash = "sha256-7gjfF7biQZOcph2dfwi2ouDn/uIYik/KBQ0k6u5Ne+Q=";
  };

  postPatch =
    # Fix typo: `tools` -> `tool`
    # upstream PR: https://codeberg.org/miurahr/multivolume/pulls/9
    ''
      substituteInPlace pyproject.toml \
        --replace-fail 'tools.setuptools_scm' 'tool.setuptools_scm'
    '';

  build-system = [
    setuptools
    setuptools-scm
  ];
  pythonImportsCheck = [
    "multivolumefile"
  ];

  meta = {
    description = "Library to provide a file-object wrapping multiple files as virtually like as a single file";
    homepage = "https://codeberg.org/miurahr/multivolume";
    license = lib.licenses.gpl2Plus;
    maintainers = [ ];
  };
}
