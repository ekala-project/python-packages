{ lib
, buildPythonPackage
, fetchFromGitHub
, replaceVars
, git
, eradicate
, mccabe
, mypy
, pycodestyle
, pydocstyle
, pyflakes
, vulture
, setuptools_80
, pylint
,
}:

let
  pylama = buildPythonPackage rec {
    pname = "pylama";
    version = "8.4.1";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "klen";
      repo = "pylama";
      rev = version;
      hash = "sha256-WOGtZ412tX3YH42JCd5HIngunluwtMmQrOSUZp23LPU=";
    };

    patches = [
      (replaceVars ./paths.patch {
        git = "${lib.getBin git}/bin/git";
      })
      ./pytest-9.1-compat.patch
      ./setuptools-82-compat.patch
    ];

    build-system = [ setuptools_80 ];

    dependencies = [
      eradicate
      mccabe
      mypy
      pycodestyle
      pydocstyle
      pyflakes
      vulture
    ];

    # escape infinite recursion pylint -> isort -> pylama

    pythonImportsCheck = [ "pylama.main" ];

    meta = {
      description = "Code audit tool for python";
      mainProgram = "pylama";
      homepage = "https://github.com/klen/pylama";
      license = lib.licenses.mit;
      maintainers = [ ];
    };
  };
in
pylama
