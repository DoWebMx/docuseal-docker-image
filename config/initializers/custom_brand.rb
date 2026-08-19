# Lee la variable de entorno APP_NAME o usa 'DocuSeal' por defecto
COMPANY_NAME = ENV.fetch('COMPANY_NAME', 'DoWeb.Mx')

APP_NAME = ENV.fetch('APP_NAME', 'Portal de Firma Digital')

# APP_DESCRIPTION = ENV.fetch('COMPANY_NAME', 'Una plataforma web que ofrece servicios seguros y eficientes de firma y procesamiento de documentos digitales.')
# APP_DESCRIPTION = ENV.fetch('APP_DESCRIPTION', 'Solución ágil y segura para el procesamiento y firma de contratos y expedientes digitales.')
APP_DESCRIPTION = ENV.fetch('APP_DESCRIPTION', 'Plataforma corporativa para la gestión, validación y firma electrónica de documentos digitales con validez legal.')
