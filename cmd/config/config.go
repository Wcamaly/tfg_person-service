package config

import (
	"github.com/joho/godotenv"
	"log"
	config "tfg/person-service/pkg/config/common"
	"tfg/person-service/pkg/libs/sql"
)

type Config struct {
	Port          string
	CommonConfigs config.Config
	DBConfig      sql.DBConfig
}

func LoadConfig() (*Config, error) {
	err := godotenv.Load(".env")

	if err != nil {
		log.Fatal("Error loading .env file")
	}

	configs := &Config{
		Port:     config.GetEnv("PORT", "8080"),
		DBConfig: sql.NewDBConfig(),
	}

	if commonConfigs := config.Common(); commonConfigs != nil {
		configs.CommonConfigs = *commonConfigs
	}

	return configs, nil
}
