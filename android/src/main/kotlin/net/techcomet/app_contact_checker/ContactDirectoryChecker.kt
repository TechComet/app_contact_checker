package net.techcomet.app_contact_checker

import android.content.ContentResolver
import android.provider.ContactsContract

class ContactDirectoryChecker(private val contentResolver: ContentResolver) {

    fun isContactInApp(phone: String, accountType: String): Boolean {
        if (phone.isBlank()) {
            return false
        }
        val cleanPhone = phone.replace(Regex("[^0-9+]"), "")
        val uri = ContactsContract.Data.CONTENT_URI
        val projection = arrayOf(ContactsContract.Data._ID)
        val selection = """
            ${ContactsContract.Data.MIMETYPE} = ? AND
            ${ContactsContract.CommonDataKinds.Phone.NORMALIZED_NUMBER} = ? AND
            ${ContactsContract.RawContacts.ACCOUNT_TYPE} = ?
        """.trimIndent()
        val selectionArgs = arrayOf(
            ContactsContract.CommonDataKinds.Phone.CONTENT_ITEM_TYPE,
            cleanPhone,
            accountType
        )
        contentResolver.query(uri, projection, selection, selectionArgs, null)?.use { cursor ->
            return cursor.count > 0
        }
        return false
    }
}