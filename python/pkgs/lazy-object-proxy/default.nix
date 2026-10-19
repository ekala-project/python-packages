{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "lazy-object-proxy";
  version = "1.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ionelmc";
    repo = "python-lazy-object-proxy";
    tag = "v${finalAttrs.version}";
    hash = "sha256-80+QJlm2X2u0OGEkYbEsdg8OiAXLiBwrkVXOF9NBL+I=";
  };

  build-system = [ setuptools-scm ];

  # Broken tests. Seem to be fixed upstream according to Travis.

  meta = {
    description = "Fast and thorough lazy object proxy";
    homepage = "https://github.com/ionelmc/python-lazy-object-proxy";
    license = with lib.licenses; [ bsd2 ];
  };
})
