![Logo](http://framework.zend.com/images/logos/ZendFramework-logo.png)

# Zend Framework 1.12
Projeto com Zend Framework para laboratório de migração. 

## Execução com docker

```
docker-compose up -d --build
```

Adicionar no arquivo `\etc\hosts`, ou equivalente no Windows: 
```
127.0.0.1   zend1.local
```

Acessar no navegador `http://zend1.local:8085/`

## Memcached

Comandos: 

`docker-compose exec -it zend1_app sh -c 'service memcached status'`

`docker-compose exec -it zend1_app sh -c 'service memcached start'`

`docker-compose exec -it zend1_app sh -c 'service memcached restart'`

`docker-compose exec -it zend1_app sh -c 'service memcached stop'`

Para subir o serviço expecificando `host` e `port`:
```
docker-compose exec -it zend1_app sh -c 'service memcached status -l 127.0.0.1 -p 11211'
```

Checando se o memcached está ativo:
```
ps -eaf | grep memcached
```


### Teste da lib-memcached

`application\controller\IndexController.php`
Método `indexAction`

Apresentado na `view` em `views\scripts\index\index.phtml`


### Referências
* [ZF1 no Github](https://github.com/zendframework/zf1)
* [Arquivos dos fontes ZF](https://framework.zend.com/downloads/archives)
* [Zend Framework 1.12 - Quick Start](https://framework.zend.com/manual/1.12/en/learning.quickstart.create-project.html)

* [Memcacked Exemplo 01](https://hotexamples.com/examples/-/Zend_Cache_Backend_Memcached/-/php-zend_cache_backend_memcached-class-examples.html)
* [Documentação Zend Cache](https://framework.zend.com/manual/1.10/en/zend.cache.introduction.html)
* [Install Memcached in Debian](https://www.pontikis.net/blog/install-memcached-php-debian)
* [Install lib-memcache in PHP7](https://serverpilot.io/docs/how-to-install-the-php-memcache-extension/)
