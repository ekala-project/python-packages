{
  buildPythonPackage,
  fetchPypi,
  defcon,
  fonttools,
  lxml,
  mutatormath,
  fontmath,
  fontparts,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "ufoprocessor";
  version = "1.14.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-/TjTzDWblBcbqNP9weTe/eIgas70+X11tIUDu4rAOwE=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    defcon
    fontmath
    fontparts
    fonttools
    mutatormath
  ]
  ++ defcon.optional-dependencies.lxml
  ++ fonttools.optional-dependencies.lxml
  ++ fonttools.optional-dependencies.ufo;

}
