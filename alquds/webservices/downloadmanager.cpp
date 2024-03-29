#include "downloadmanager.h"
#include <QCoreApplication>
#include <QFile>
#include <QFileInfo>
#include <QList>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QStringList>
#include <QTimer>
#include <QUrl>
#include <QDebug>

DownloadManager::DownloadManager()
{
//    connect(&manager, SIGNAL(finished(QNetworkReply*)),
//            SLOT(downloadFinished(QNetworkReply*)));

    manager = new QNetworkAccessManager(this);
    connect(manager, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(OnDownloadFinished(QNetworkReply*)));

}

void DownloadManager::Download(QString url)
{
//    qDebug()<<"DownloadManager::doDownload "<<url;
    QNetworkReply *tReply = manager->get(QNetworkRequest(QUrl(url)));
    connect(tReply, SIGNAL(downloadProgress(qint64,qint64)), this, SIGNAL(downloadProgress(qint64,qint64)));

}

void DownloadManager::OnDownloadFinished(QNetworkReply *reply)
{
    emit DownloadFinished(reply->readAll());
    reply->deleteLater();
}
