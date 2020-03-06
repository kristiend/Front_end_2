<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="/a/js/libs/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="/a/css/general/bootstrap-datetimepicker-3.1.4.min.css" rel="stylesheet" />
    <link href="/a/js/libs/bootstrap/3.3.2/plugins/datatables-1.10.7/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="/a/css/general/jquery.validate.min.css" rel="stylesheet" />
    <link href="/a/css/fpe/select.dataTables.min.css" rel="stylesheet" />
    <link href="/a/css/general.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="/a/css/general/common.css" rel="stylesheet" />
    <link href="/a/css/general/jquery.qtip.min.css" rel="stylesheet" />
    <style></style>
</head>
<body>
<br/>
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">Consultar Solicitud Electrónica</h3>
                        </div>
                        <div class="panel-body">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Búsqueda de Solicitudes</h3>
                                </div>
                                <div class="panel-body">
                                    <form name="frmConsultarSolicitud" id="frmConsultarSolicitud" method="post">
                                        <div class="col-sm-12 form-group">
                                            <div class="col-sm-5">
                                                <div class="col-sm-4 text-right">
                                                    <label for="numeroExpediente" class="control-label">N° Expediente:</label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <input name="numeroExpediente" id="numeroExpediente" class="form-control input-sm groupConsultaSolFis" maxlength="12"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-5">
                                                <div class="col-sm-4 text-right">
                                                    <label for="numeroSolicitud" class="control-label">N° Solicitud:</label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <input name="numeroSolicitud" id="numeroSolicitud" class="form-control input-sm groupConsultaSolFis" />
                                                </div>
                                            </div>
                                            <div class="col-sm-2">&nbsp;</div>
                                        </div>
                                     
                                        <div class="col-sm-12 form-group">
                                           	<div class="col-sm-12">
                                            <p><b>Fecha Solicitud:</b></p>
                                        	</div>
                                            <div class="col-sm-5">
                                                <div class="col-sm-4 text-right">
                                                    <label for="fechaDesde" class="control-label">Desde:</label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class='input-group date' id='divfechaDesde'>
                                                        <input type='text' size="16" class="form-control groupConsultaSolFis" id="fechaDesde"
                                                            name="fechaDesde" data-inputmask="'alias': 'date'"/>
                                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-5">
                                                <div class="col-sm-4 text-right">
                                                    <label for="fechaHasta" class="control-label">Hasta:</label>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class='input-group date' id='divfechaHasta'>
                                                        <input type='text' size="16" class="form-control groupConsultaSolFis" id="fechaHasta"
                                                            name="fechaHasta" data-inputmask="'alias': 'date'"/>
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar">
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">&nbsp;</div>
                                        </div>
                                        <div class="col-sm-12 form-group">
                                            <div class="col-sm-4 col-xs-2"></div>
                                            <div class="col-sm-2 col-xs-4">
                                                <button type="button" class="btn btn-primary btn-block btn-sm" id="btnBuscar">Buscar</button>
                                            </div>
                                            <div class="col-sm-2 col-xs-4">
                                                <button type="reset" class="btn btn-default btn-block btn-sm" id="btnLimpiar">Limpiar</button>
                                            </div>
                                            <div class="col-sm-4 col-xs-2"></div>
                                        </div>
                                        <input type="hidden" name="numRuccontri" id="numRuccontri" value="<c:out value="${numRuccontri}" />"/>
                                    </form>
                                    
                                    <form id="frmExportar" name="frmExportar" action="${pageContext.request.contextPath}/solicitudFiscalizacion?action=verExcel" method="post" >
                                       <input type="hidden" value="" id="nombreReporte" name="nombreReporte"/>
                                    </form>
                                    
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Solicitudes</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="col-sm-12 row">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <table id="dataTableSolicitudFiscalizacion" class="table text-center display">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-center" valign="middle">Nro. Expediente</th>
                                                            <th class="text-center" valign="middle">Nro. Solicitud</th>
                                                            <th class="text-center" valign="middle">Fecha Solicitud</th>
                                                            <th class="text-center" valign="middle">Tipo de Solicitud</th>
                                                            <th class="text-center" valign="middle">Nro. Requerimiento</th>
                                                            <th class="text-center" valign="middle">Estado de Solicitud</th>
                                                            <th class="text-center" valign="middle">Carta de atención</th>
                                                            <th class="text-center" valign="middle">Expediente</th>
                                                        </tr>
                                                    </thead>
                                                    
                                                </table>

                                            </div>
                                        </div>

                                    </div>
                                    <br/>
                                    <div class="col-sm-12 row">
                                        <div class="col-sm-10 col-xd-8"></div>
                                        <div class="col-sm-2 col-xs-4">
                                            <button type="button" class="btn btn-primary btn-block btn-sm" id="btnExportar">Exportar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <jsp:include page="ModalReporte.jsp" />
                            <jsp:include page="VerDocumentosExpediente.jsp" />
                            <jsp:include page="VerArchivosDocumento.jsp" />   
  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/a/js/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/a/js/libs/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="/a/js/general/bootstrap-filestyle.min.js"></script>
    <script src="/a/js/libs/bootstrap/3.3.2/plugins/jquery.inputmask-3.1/dist/jquery.inputmask.bundle.min.js"></script>
    <script src="/a/js/libs/bootstrap/3.3.2/plugins/jquery-validation-1.13.1/dist/jquery.validate.min.js"></script>
    <script src="/a/js/libs/bootstrap/3.3.2/plugins/jquery-validation-1.13.1/dist/additional-methods.min.js"></script>
    <script src="/a/js/libs/bootstrap/3.3.2/plugins/jquery.blockUI-2.56.0/jquery.blockUI.js"></script>
    <script src="/a/js/fpe/jquery.dataTables.min.js"></script>
    <script src="/a/js/fpe/datatables.select.min.js"></script>
    <script src="/a/js/general/jquery_alert.js"></script>
    <script src="/a/js/general/jquery_plugin.js"></script>
    <script src="/a/js/general/jqueryvalidate_methods.js"></script>
    <!--<script src="/a/js/fiscalizacion/jqueryvalidate_methods.js"></script>-->
    <script src="/a/js/general/moment-with-locales.js"></script>
    <script src="/a/js/general/bootstrap-datetimepicker-3.1.4.min.js"></script>
    <script src="/a/js/general/inputmask_extended.js"></script>
    <script src="/a/js/general/jquery.form.min.js"></script>
    <script src="/a/js/general/jquery.qtip.min.js"></script>
    <script src="/a/js/general/common.js"></script>
    <c:set var="contextPathUrl" scope="session" value="${pageContext.request.contextPath}" />
    <script src="${contextPathUrl}/static/js/VerDocumentosExpediente.js" type="text/javascript"></script>
    <script src="${contextPathUrl}/static/js/VerArchivosDocumento.js" type="text/javascript"></script>
    <script src="${contextPathUrl}/static/js/ConsultarSolicitudElectronica.js" type="text/javascript"></script>
    <script type="text/javascript">
        var contextPathUrl = "${contextPathUrl}";
        $(document).ready(
            function () {
                aplicarMascarasConsultarSolicitudFiscalizacion();
                inicializarEventosConsultarSolicitudFiscalizacion();
                inicializarValidFormConsultarSolicitudFiscalizacion();
                inicializarDataTable();
            });
    </script>
    <input type="hidden" name="WSContext" id="WSContext" value="<c:out value="${contextPathUrl}" />"/>
</body>

</html>