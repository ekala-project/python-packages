{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "colorclass";
  version = "2.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-bU/ih3ZhZqmMp7xvYxLa8EoEgbHtpD5xc0hAUcCrQ2Y=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'poetry>=0.12' 'poetry-core>=1.0.0' \
      --replace-fail 'poetry.masonry' 'poetry.core.masonry'
  '';

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "colorclass" ];

  meta = {
    description = "Automatic support for console colors";
    homepage = "https://github.com/Robpol86/colorclass";
    license = lib.licenses.mit;
  };
}
