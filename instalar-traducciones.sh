#!/bin/bash
# Script para copiar traducciones después de composer install/update
# Se ejecuta automáticamente si está configurado en composer.json

echo "📦 Instalando traducciones al español..."

# Función para copiar traducciones
copy_translations() {
    local source=$1
    local dest=$2

    if [ -d "$source" ]; then
        mkdir -p "$dest"
        cp -r "$source"/* "$dest/" 2>/dev/null
        echo "  ✓ Copiado: $dest"
    fi
}

# Core TastyIgniter
copy_translations "lang/vendor/core/es_ES" "vendor/tastyigniter/core/resources/lang/es_ES"

# Extensiones
copy_translations "lang/vendor/ti-ext-user/es_ES" "vendor/tastyigniter/ti-ext-user/resources/lang/es_ES"
copy_translations "lang/vendor/ti-ext-cart/es_ES" "vendor/tastyigniter/ti-ext-cart/resources/lang/es_ES"
copy_translations "lang/vendor/ti-ext-reservation/es_ES" "vendor/tastyigniter/ti-ext-reservation/resources/lang/es_ES"
copy_translations "lang/vendor/ti-ext-local/es_ES" "vendor/tastyigniter/ti-ext-local/resources/lang/es_ES"
copy_translations "lang/vendor/ti-ext-frontend/es_ES" "vendor/tastyigniter/ti-ext-frontend/resources/lang/es_ES"

# Tema Orange
copy_translations "lang/vendor/ti-theme-orange/es_ES" "vendor/tastyigniter/ti-theme-orange/resources/lang/es_ES"

echo "✅ Traducciones instaladas correctamente"

# Limpiar caché si es un entorno local de desarrollo
if [ -f "artisan" ]; then
    echo "🧹 Limpiando caché..."
    php artisan cache:clear 2>/dev/null || true
    php artisan view:clear 2>/dev/null || true
fi
