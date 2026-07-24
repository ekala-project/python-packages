{
  lib,
  buildPythonPackage,
  pythonAtLeast,
  fetchFromGitHub,

  # build-system
  setuptools,

  # optional-dependencies
  dill,
  flask,
  graphviz,
  multiprocess,
  regex,
  requests,
  sphinx,
  sphinx-click,

  # tests
  ddt,
  cryptography,
  schedula,
}:

buildPythonPackage rec {
  pname = "schedula";
  version = "1.5.78";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "vinci1it2000";
    repo = "schedula";
    tag = "v${version}";
    hash = "sha256-fhcG2N524KlwaG+inOyQJaXKoMhmR6Yddff8CDi8lhk=";
  };

  build-system = [ setuptools ];

  optional-dependencies = rec {
    # dev omitted, we have nativeCheckInputs for this
    # form omitted, as it pulls in a kitchensink of deps, some not even packaged in nixpkgs
    io = [ dill ];
    parallel = [ multiprocess ];
    plot = [
      requests
      graphviz
      regex
      flask
    ];
    sphinx = [
      sphinx
      sphinx-click
    ]
    ++ plot;
    web = [
      requests
      regex
      flask
    ];
  };
  pythonImportsCheck = [ "schedula" ];

  meta = {
    description = "Smart function scheduler for dynamic flow-based programming";
    homepage = "https://github.com/vinci1it2000/schedula";
    license = lib.licenses.eupl11;
    maintainers = [ ];
    # at least some tests fail on Darwin
    platforms = lib.platforms.linux;
  };
}
